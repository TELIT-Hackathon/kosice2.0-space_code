import json
from enum import Enum

import requests
from flask import Flask, request
from flask_restx import Api, Resource, reqparse, inputs
import json
import pandas as pd
import geopandas


def calc_intersection(df_merge, df_for_compare, colummn,x_for_compare, y_for_compare, radius_distance):
    for idx, item in df_merge.iterrows():
        gdf = geopandas.GeoDataFrame(df_merge[idx:idx+1], geometry=geopandas.points_from_xy(df_merge[idx:idx+1]["latitude"], df_merge[idx:idx+1]["longitude"]), crs="EPSG:4326")
        gdf=gdf.to_crs("EPSG:3857") #convert projection web mercator or find best epsg code, where your data have.
        gdf['buffergeometry25miles'] = gdf['geometry'].buffer(radius_distance) # 25 mile = 40233.6 meter radius
        gdf.set_geometry('buffergeometry25miles',inplace=True)
        givengdf = geopandas.GeoDataFrame(df_for_compare, geometry=geopandas.points_from_xy(x_for_compare, y_for_compare, crs="EPSG:4326"))
        givengdf=givengdf.to_crs("EPSG:3857")
        intersect_df = geopandas.overlay(gdf, givengdf, how='intersection', keep_geom_type=False)
        # print(len(intersect_df))
        df_merge.loc[idx, colummn] = len(intersect_df)

import pandas as pd
import geopandas
import os
dataset_path = "_data"
df_schools = pd.read_csv("schools.csv")

filename = "open_ke_mhd.geojson"
file = open(os.path.join(dataset_path,filename))
df_mhd = geopandas.read_file(file)
df_mhd.drop_duplicates(subset='zastavka_nazov', inplace=True)

dataset_path = "_data"
print("DATASET LOADING -> Schools")
filename = "culture.csv"
df_culture  = pd.read_csv(filename)

filename = "cycle_points.geojson"
file = open(os.path.join(dataset_path,filename))
df_cycle_points = geopandas.read_file(file)
df_cycle_points["y"] = df_cycle_points.apply(lambda row: float(row.geometry[0].y), axis=1)
df_cycle_points["x"] = df_cycle_points.apply(lambda row: float(row.geometry[0].x), axis=1)

# GLOABAL VARIABLES -> later convert to env files
rest_port = 3004
version = '0.1'

# DEFINE APP
app = Flask(__name__)
api = Api(app,
          version=version,
          title='RehaPiano - AI module',
          description='Module which make magic ',
          license='SpaceCode s.r.o.',
          contact='hlibokymaros@gmail.com',
          contact_url='https://rehapiano.com/contact',
          doc='/docs/',
          prefix='/'
          )

# DEFINE NAMESPACE
ns_gateway = api.namespace('api/', description='Api namespace')


@ns_gateway.route('/rentanal', methods=["post"])
class TEST(Resource):
    def post(self):
        request_body_json = request.get_json()
        print(request_body_json)

        # GET DATA FROM VILKO BE
        r = requests.get(url='http://192.168.233.82:8080/rent/all')
        j = r.json()
        df_merge = pd.DataFrame.from_dict(j["content"])


        ##### FILTERING
        # FILTER BY PRICE
        df_merge = df_merge.loc[df_merge["pricePerPerson"] <= request_body_json["content"]["maxPrice"]]

        # FILTER BY LOCALITY
        df_merge = df_merge.loc[df_merge["cityPart"].isin(request_body_json["content"]["cityParts"])]
        df_merge.reset_index(inplace=True)

        df_merge["edu_kindergarten"] = 0
        df_merge["edu_primarySchool"] = 0
        df_merge["edu_highSchool"] = 0
        column_for_compare = []
        sort_order = []
        if request_body_json["content"]["education"]["kindergarten"]:
        # if True:
            column_for_compare.append("edu_kindergarten")
            sort_order.append(False)
            df_tmp = df_schools.loc[df_schools["type"]=="elementary"]
            print(df_tmp.shape)
            calc_intersection(df_merge=df_merge,
                              df_for_compare=df_tmp,
                              x_for_compare=df_tmp["x"],
                              y_for_compare=df_tmp["y"],
                              colummn="edu_kindergarten",
                              radius_distance=750)

        if request_body_json["content"]["education"]["primarySchool"]:
        # if True:
            column_for_compare.append("edu_primarySchool")
            sort_order.append(False)
            df_tmp = df_schools.loc[df_schools["type"]=="primary"]
            print(df_tmp.shape)
            calc_intersection(df_merge=df_merge,
                              df_for_compare=df_tmp,
                              x_for_compare=df_tmp["x"],
                              y_for_compare=df_tmp["y"],
                              colummn="edu_primarySchool",
                              radius_distance=750)

        if request_body_json["content"]["education"]["highSchool"]:
        # if True:
            column_for_compare.append("edu_highSchool")
            sort_order.append(False)
            df_tmp = df_schools.loc[df_schools["type"]=="high"]
            print(df_tmp.shape)
            calc_intersection(df_merge=df_merge,
                              df_for_compare=df_tmp,
                              x_for_compare=df_tmp["x"],
                              y_for_compare=df_tmp["y"],
                              colummn="edu_highSchool",
                              radius_distance=750)
                    # "transportation":{
            #     "publicTransport":False,
            #     "nonMotor":False,
            #     "motor":False
            # }
            df_merge["trans_nonMotor"] = 0
            df_merge["trans_public"] = 0

        if request_body_json["content"]["transportation"]["nonMotor"]:
        # if True:
            column_for_compare.append("trans_nonMotor")
            sort_order.append(False)
            calc_intersection(df_merge=df_merge,
                              df_for_compare=df_cycle_points,
                              x_for_compare=df_cycle_points["x"],
                              y_for_compare=df_cycle_points["y"],
                              colummn="trans_nonMotor",
                              radius_distance=1000)

        if request_body_json["content"]["transportation"]["publicTransport"]:
        # if True:
            column_for_compare.append("trans_public")
            sort_order.append(False)
            print(df_tmp.shape)
            calc_intersection(df_merge=df_merge,
                              df_for_compare=df_mhd,
                              x_for_compare=df_mhd["x"],
                              y_for_compare=df_mhd["y"],
                              colummn="trans_public",
                              radius_distance=500)

        print(column_for_compare)
        df_out = df_merge.sort_values(column_for_compare, ascending = sort_order)

        json_list = []

        for id in df_out['id']:
            for obj in j['content']:
                if obj["id"] == id:
                    json_list.append(obj)

        response = {
            "responseCode" : "SUCCESSFUL",
            "content" : json_list
        }

        return response

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=rest_port, debug=True)
