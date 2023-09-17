namespace guitarstore;

entity Product {
  key ID: UUID;
  productInformation: String(200);
  targetAudiencePitch: String(200);
  discount: Decimal(5,2);
  warehouse: Association to Warehouse;
}

entity Warehouse {
  key ID: UUID;
  warehouseStock: Integer;
  products: Composition of many Product on products.warehouse = $self;
}

