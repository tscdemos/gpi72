using { guitarstore } from '../db/schema.cds';

service guitarstoreSrv {
  entity Warehouse as projection on guitarstore.Warehouse;
}