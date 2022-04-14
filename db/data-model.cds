using {
    managed,
    sap,
    cuid
} from '@sap/cds/common';

namespace ppg.Emerge;

entity ProductSurvey : cuid, managed {
    System            : String(3);
    Customer          : String;
    RepresentName     : String;
    RepresentTitle    : String;
    Airframer         : Association to Airframer;
    Program           : Association to Program;
    Component         : Association to Component;
    Active            : Boolean;
    ProductType       : Association to ProductType;
    Product           : String;
    ProductKitsNumber : Integer;
    BusinessShare     : Integer;

}

entity ProductType : sap.common.CodeList {
    key Id : String;
}

// entity Airframer : managed {
//     key Id          : String;
//         Name        : String;
//         to_Programs : Composition of many Program
//                           on to_Programs.to_Airframer = $self;
// }

// entity Program : managed {
//     key Id            : String;
//         Name          : String;
//         to_Airframer  : Association to Airframer;
//         to_Components : Composition of many Component
//                             on to_Components.to_Program = $self;
// }

// entity Component : managed {
//     key Id         : String;
//         Name       : String;
//         to_Program : Association to Program;
// }

entity Airframer{
    key Id : String;
    Name : String;
}

entity Program{
    key Id : String;
    Name : String;
    airframer_Id : String;
}

entity Component{
    key Id : String;
    Name : String;
    program_Id : String;
}
