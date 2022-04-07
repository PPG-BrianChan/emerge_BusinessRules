using ppg.Emerge from '../db/data-model';

service EmergeService //@( requires: ['Emerge_KBU'])
{
    @Capabilities : {
        InsertRestrictions.Insertable : true,
        UpdateRestrictions.Updatable  : true,
        DeleteRestrictions.Deletable  : false
    }
    entity ProductSurvey as projection on Emerge.ProductSurvey;

    entity Airframer     as projection on Emerge.Airframer;
    entity Program       as projection on Emerge.Program;
    entity Component     as projection on Emerge.Component;
}
