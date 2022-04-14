const { executeHttpRequest } = require('@sap-cloud-sdk/core');

module.exports = async function (req, Programs, service) {
    console.log("------Entered read event 2------");
    const id = 'ca929111a0da40cea7d84ae7ce30f341';

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
        console.log(response.data.Result[0].program_table);

        console.log("-----------Check type--------------");
        console.log(typeof response.data.Result[0].program_table);

        const programtable = response.data.Result[0].program_table;

        console.log("Number of rows:",programtable.length);
        
        console.log("-------------Before insert--------------");

        for (let index = 0; index < programtable.length; index++) {
            // const airframerrow = airframertable[index];
            // await INSERT.into(airframers).rows({
            //     Id: airframerrow.Id,
            //     Name: airframerrow.Name,
            //   });
            const programrow = programtable[index];
            await service.insert(programrow) .into (Programs);
          }

        console.log("-------------END Insert-------------------"); 

        // return programtable;
    }

    catch (error) {
        console.log(error.message)
    }

}