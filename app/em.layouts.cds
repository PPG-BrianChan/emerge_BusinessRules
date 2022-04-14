using EmergeService as em from '../srv/EmergeService';

//
// annotatios that control the fiori layout
//

annotate em.ProductSurvey with @odata.draft.enabled : true;

annotate em.ProductSurvey with {
    Customer          @Search.defaultSearchElement : true;
    RepresentName     @Search.defaultSearchElement : true;
    RepresentTitle    @Search.defaultSearchElement : true;
    Airframer         @Search.defaultSearchElement : true;
    Program           @Search.defaultSearchElement : true;
    Component         @Search.defaultSearchElement : true;
    ProductType       @Search.defaultSearchElement : true;
    Product           @Search.defaultSearchElement : true;
    ProductKitsNumber @Search.defaultSearchElement : true;
    BusinessShare     @Search.defaultSearchElement : true;
}

annotate em.ProductSurvey with @UI : {

    HeaderInfo                        : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : '{i18n>ProductSurvey}',
        TypeNamePlural : '{i18n>ProductSurvey}',
        ImageUrl       : 'https://icon-library.com/images/products-icon/products-icon-5.jpg',
        Title          : {Value : RepresentName},
        Description    : {Value : RepresentTitle}
    },

    PresentationVariant               : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : Customer,
            Descending : true
        }]
    },

    SelectionFields                   : [
        Customer,
        Airframer_Id,
        Program_Id,
        Component_Id,
        ProductType_Id,
        createdAt,
        createdBy
    ],

    LineItem                          : [
        {
            $Type : 'UI.DataField',
            Value : Customer
        },
        {
            $Type : 'UI.DataField',
            Value : RepresentName
        },
        {
            $Type : 'UI.DataField',
            Value : RepresentTitle
        },
        {
            $Type : 'UI.DataField',
            Value : Airframer_Id,
        },
        {
            $Type : 'UI.DataField',
            Value : Program_Id
        },
        {
            $Type : 'UI.DataField',
            Value : Component_Id
        },
    ],
    
    HeaderFacets                      : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#ClientLinkCRM',
        Label  : '{i18n>ClientLinkCRM}'
    }, ],

    Facets                            : [
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'ObjectInformation',
            Label  : '{i18n>ObjectInformation}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#ObjectInformationFG'
            }, ]
        },
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'AdminData',
            Label  : '{i18n>AdminData}',
            Facets : [
                {
                    $Type  : 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#CreationDetailsFG',
                    Label  : '{i18n>CreationDetails}'
                },
                {
                    $Type  : 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#ModificationDetailsFG',
                    Label  : '{i18n>ModificationDetails}'
                },
            ]
        }
    ],

    FieldGroup #ClientLinkCRM         : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : Customer
            },
            {
                $Type : 'UI.DataField',
                Value : RepresentName
            },
            {
                $Type : 'UI.DataField',
                Value : RepresentTitle
            },
        ]
    },

    FieldGroup #ObjectInformationFG   : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            // {
            //     $Type : 'UI.DataField',
            //     Value : AccountId
            // },
            // {
            //     $Type : 'UI.DataField',
            //     Value : System
            // },
            {
                $Type : 'UI.DataField',
                Value : Airframer_Id
            },
            {
                $Type : 'UI.DataField',
                Value : Program_Id
            },
            {
                $Type : 'UI.DataField',
                Value : Component_Id
            },
            {
                $Type : 'UI.DataField',
                Value : Active
            },
            {
                $Type : 'UI.DataField',
                Value : ProductType_Id
            },
            {
                $Type : 'UI.DataField',
                Value : Product
            },
            {
                $Type : 'UI.DataField',
                Value : ProductKitsNumber
            },
            {
                $Type : 'UI.DataField',
                Value : BusinessShare
            },
        ]
    },

    FieldGroup #CreationDetailsFG     : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : createdAt
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy
            }
        ]
    },

    FieldGroup #ModificationDetailsFG : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : modifiedAt
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy
            }
        ]
    }
};

