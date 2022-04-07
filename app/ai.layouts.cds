using AirframerService as ai from '../srv/AirframerService';

//
// annotatios that control the fiori layout
//

annotate ai.Airframer with {
    Id @Search.defaultSearchElement : true;
    Name        @Search.defaultSearchElement : true;
}

annotate ai.Airframer with @UI : {
    HeaderInfo                        : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : '{i18n>Airframer}',
        TypeNamePlural : '{i18n>Airframers}',
        Title          : {Value : Name}
    },
    PresentationVariant               : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : Id,
            Descending : true
        }]
    },
    SelectionFields                   : [
        Name,
        createdAt,
        createdBy
    ],
    LineItem                          : [
        {
            $Type : 'UI.DataField',
            Value : Id
        },
        {
            $Type : 'UI.DataField',
            Value : Name
        }
    ],
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
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Target : 'to_Programs/@UI.LineItem',
            Label  : '{i18n>Programs}'
        }
    ],
    FieldGroup #ObjectInformationFG   : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : Id
            },
            {
                $Type : 'UI.DataField',
                Value : Name
            }
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

annotate ai.Program with {
    Id @Search.defaultSearchElement : true;
    Name      @Search.defaultSearchElement : true;
}
annotate ai.Program with @UI : {
    HeaderInfo                        : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : '{i18n>Program}',
        TypeNamePlural : '{i18n>Programs}',
        Title          : {Value : Name}
    },
    PresentationVariant               : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : Id,
            Descending : true
        }]
    },
    SelectionFields                   : [
        Name,
        to_Airframer_Id,
        createdAt,
        createdBy
    ],
    LineItem                          : [
        {
            $Type : 'UI.DataField',
            Value : Id
        },
        {
            $Type : 'UI.DataField',
            Value : Name
        }
    ],
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
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Target : 'to_Components/@UI.LineItem',
            Label  : '{i18n>Components}'
        }
    ],
    FieldGroup #ObjectInformationFG   : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : Id
            },
            {
                $Type : 'UI.DataField',
                Value : Name
            }
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

annotate ai.Component with {
    Id @Search.defaultSearchElement : true;
    Name        @Search.defaultSearchElement : true;
}

annotate ai.Component with @UI : {
    HeaderInfo                        : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : '{i18n>Component}',
        TypeNamePlural : '{i18n>Components}',
        Title          : {Value : Name}
    },
    PresentationVariant               : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : Id,
            Descending : true
        }]
    },
    SelectionFields                   : [
        Name,
        to_Program_Id,
        createdAt,
        createdBy
    ],
    LineItem                          : [
        {
            $Type : 'UI.DataField',
            Value : Id
        },
        {
            $Type : 'UI.DataField',
            Value : Name
        }
    ],
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
    FieldGroup #ObjectInformationFG   : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : Id
            },
            {
                $Type : 'UI.DataField',
                Value : Name
            }
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
