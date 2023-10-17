using hc450.officesupplies as officesupplies from '../db/data-model';

service CatalogService {
 @odata.draft.enabled :true
 entity Products as projection on officesupplies.Products;
 entity Suppliers as projection on officesupplies.Suppliers;
};