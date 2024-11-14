#!/usr/bin/env python

def remove_prefix(self, bucket, prefix):
        if bucket is None or bucket == "":
                raise Exception('bucket name is invalid')
        self._execute('DELETE', bucket, prefix, headers={'x-minio-force-delete': 'true'})
                                    
from minio import Minio

setattr(Minio, "remove_prefix", remove_prefix)

# EDIT bucket_name, folder_prefix and endpoint and credentials
bucket_name = 'warp-bucket'
folder_prefix = ''
minioClient = Minio('localhost:9000',access_key='minioadmin',secret_key='minioadmin',secure=True)

minioClient.remove_prefix(bucket_name, folder_prefix)

