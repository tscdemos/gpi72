using { guitarstoreSrv } from '../srv/service.cds';

annotate guitarstoreSrv.Warehouse with @odata.draft.enabled;
annotate guitarstoreSrv.Warehouse with @cds.odata.valuelist;
annotate guitarstoreSrv.Product with @UI.HeaderInfo: { TypeName: 'Product', TypeNamePlural: 'Products', Title: { Value: productInformation } };
annotate guitarstoreSrv.Product with {
  ID @Common.Text: { $value: productInformation, ![@UI.TextArrangement]: #TextOnly }
};
annotate guitarstoreSrv.Product with @UI.Identification: [{ Value: productInformation }];
annotate guitarstoreSrv.Product with {
  productInformation @title: 'Product Information';
  targetAudiencePitch @title: 'Target Audience Pitch';
  discount @title: 'Discount'
};

annotate guitarstoreSrv.Product with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: productInformation },
    { $Type: 'UI.DataField', Value: targetAudiencePitch },
    { $Type: 'UI.DataField', Value: discount }
];

annotate guitarstoreSrv.Product with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: productInformation },
    { $Type: 'UI.DataField', Value: targetAudiencePitch },
    { $Type: 'UI.DataField', Value: discount }
  ]
};

annotate guitarstoreSrv.Product with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate guitarstoreSrv.Warehouse with @UI.HeaderInfo: { TypeName: 'Warehouse', TypeNamePlural: 'Warehouses', Title: { Value: warehouseStock } };
annotate guitarstoreSrv.Warehouse with {
  ID @Common.Text: { $value: warehouseStock, ![@UI.TextArrangement]: #TextOnly }
};
annotate guitarstoreSrv.Warehouse with @UI.Identification: [{ Value: warehouseStock }];
annotate guitarstoreSrv.Warehouse with {
  warehouseStock @title: 'Warehouse Stock'
};

annotate guitarstoreSrv.Warehouse with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: warehouseStock }
];

annotate guitarstoreSrv.Warehouse with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: warehouseStock }
  ]
};

annotate guitarstoreSrv.Warehouse with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'Product', Target : 'products/@UI.LineItem' }
];

