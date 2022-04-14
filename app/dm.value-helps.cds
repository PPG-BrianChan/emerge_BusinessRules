using {ppg.Emerge as dm} from '../db/data-model';

//
// annotations for value helps
//

annotate dm.ProductSurvey {

    Airframer @Common.ValueList : {
        CollectionPath  : 'Airframer',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : Airframer_Id,
                ValueListProperty : 'Id'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Name'
            },
        ],
        SearchSupported : true
    };

    Program   @Common.ValueList : {
        CollectionPath  : 'Program',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : Program_Id,
                ValueListProperty : 'Id'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Name'
            },
            {
                $Type             : 'Common.ValueListParameterFilterOnly',
                ValueListProperty : 'airframer_Id',
            },
            {
                $Type             : 'Common.ValueListParameterIn',
                LocalDataProperty : Airframer_Id, //points to main entity element
                ValueListProperty : 'airframer_Id', //points to elements within the value help
            },
        ],
        SearchSupported : true,
    };

    Component @Common.ValueList : {
        CollectionPath  : 'Component',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : Component_Id,
                ValueListProperty : 'Id'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Name'
            },
            {
                $Type             : 'Common.ValueListParameterFilterOnly',
                ValueListProperty : 'program_Id',
            },
            {
                $Type             : 'Common.ValueListParameterIn',
                LocalDataProperty : Program_Id,
                ValueListProperty : 'program_Id',
            },
        ],
        SearchSupported : true,
    };

}
