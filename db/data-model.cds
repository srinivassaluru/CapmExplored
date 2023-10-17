using {
    managed,
    Currency
} from '@sap/cds/common';


namespace hc450.officesupplies;

entity Products : managed {
        @Common.Label: 'UUID'
    key ID               : UUID;
        identifier       : String           @Common.Label: 'ProductID';
        title            : localized String @(Common.Label: 'Name');
        description      : localized String;
        availability     : Integer;
        storage_capacity : Integer;
        criticality      : Integer;
        price            : Decimal(9, 2);
        currency         : Currency;
        supplier         : Association to Suppliers;
        image_url        : String;
}

entity Suppliers : managed {
    key ID         : UUID;
        identifier : String;
        name       : String;
        phone      : String;
        building   : String;
        street     : String @multiline;
        postCode   : String;
        city       : String;
        country    : String;
        products   : Composition of many Products
                         on products.supplier = $self;
}
