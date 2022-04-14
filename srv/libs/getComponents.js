const { executeHttpRequest } = require('@sap-cloud-sdk/core');

module.exports = async function (req, Components, service) {
    console.log("------Entered read event 3------");
    const id = '49cc33f21c344d6d85f7bba42ac9d436';

    try {
        const payload = {
            RuleServiceId: id,
            Vocabulary: [{}]
        }

        const response = await executeHttpRequest(
            {
                destinationName: "BUSINESS_RULES",
            },
            { method: "POST", data: payload, url: "/rest/v2/workingset-rule-services" }
        );

        console.log("-----------Check content-----------")
        console.log(response.data.Result[0].component_table);

        console.log("-----------Check type--------------");
        console.log(typeof response.data.Result[0].component_table);

        const componenttable = response.data.Result[0].component_table;

        console.log("Number of rows:",componenttable.length);
        
        console.log("-------------Before insert--------------");

        for (let index = 0; index < componenttable.length; index++) {
            // const airframerrow = airframertable[index];
            // await INSERT.into(airframers).rows({
            //     Id: airframerrow.Id,
            //     Name: airframerrow.Name,
            //   });
            const componentrow = componenttable[index];
            await service.insert(componentrow) .into (Components);
          }

        console.log("-------------END Insert-------------------"); 

        // return componenttable;
    }

    catch (error) {
        console.log(error.message)
    }

}