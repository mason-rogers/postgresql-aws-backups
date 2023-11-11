# PostgreSQL AWS Backups

| Environment Variable.    | Description                                                                                              | Default         |
|--------------------------|----------------------------------------------------------------------------------------------------------|-----------------|
| POSTGRES_USER            | Username of the PostgreSQL user being used to backup                                                     | postgres        |
| POSTGRES_PASSWORD        | Password to authenticate with POSTGRES_USER                                                              |                 |
| POSTGRES_HOST            | IP/Hostname of the PostgreSQL Server                                                                     | 127.0.0.1       |
| POSTGRES_DATABASES       | Database names that need to be backed up (split by ",") ie. `my_database,my_other_database`              |                 |
| AWS_ENDPOINT             | **REQUIRED** S3 Compatible endpoint to upload the backup file to                                         |                 |
| AWS_ACCESS_KEY_ID        | **REQUIRED** AccessKeyId of the user being used to upload the file                                       |                 |
| AWS_SECRET_ACCESS_KEY    | **REQUIRED** SecretAccessKey of the user being used to upload the file                                   |                 |
| AWS_DEFAULT_REGION       | The AWS region used to upload the backup.                                                                | eu-central-1    |
| AWS_BUCKET               | **REQUIRED** The name of the bucket where backups are uploaded                                           |                 |
| AWS_FILENAME_PREFIX      | The prefix of the file name (ie /production/)                                                            | /               |
| HEARTBEAT_URL            | An endpoint to send a HTTP request to as a ping upon successful backup. Can be used to create monitor.   |                 |