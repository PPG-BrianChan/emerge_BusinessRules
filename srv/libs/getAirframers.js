const { executeHttpRequest } = require('@sap-cloud-sdk/core');

module.exports = async function (req, Airframers, service) {
    console.log("------Entered read event------");
    const id = '7b5103f1f24047a5a1992e3dc445cdee';

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
        console.log(response.data.Result[0].airframer_table);

        console.log("-----------Check type--------------");
        console.log(typeof response.data.Result[0].airframer_table);

        const airframertable = response.data.Result[0].airframer_table;

        console.log("Number of rows:",airframertable.length);

        console.log("-------------Before insert--------------");

        for (let index = 0; index < airframertable.length; index++) {
            // const airframerrow = airframertable[index];
            // await INSERT.into(airframers).rows({
            //     Id: airframerrow.Id,
            //     Name: airframerrow.Name,
            //   });
            const airframerrow = airframertable[index];
            await service.insert(airframerrow) .into (Airframers);
          }

        console.log("-------------END Insert-------------------");  

        // return airframertable;
        
    }

    catch (error) {
        console.log(error.message)
    }


    // From CreationPOC
    // const id = '648b1912c67b42769946a8a608cd8268';
    // console.log('/rest/v1/projects/${id}/rules');
    // try {
    //     const getairframers = await executeHttpRequest({
    //         destinationName: "BUSINESS_RULES_REPO"
    //     },
    //         {
    //             method: 'GET',
    //             url: '/rest/v1/projects/${id}/rules'
    //         })

    //     const airframersTable = getairframer.data[0].DecisionTable.Cell.filter(el => el.ColumnId === '1');
    //     const airframersDetails = airframersTable.map(el => el.AST.find(el => el.Id === '3'));
    //     const airframersList = airframersDetails.map(el => { return { Id: el.Value } });

    //     return airframersList;
    // }
    // catch (error) {
    //     console.log(error.message);
    // }

    // const getairframers = await executeHttpRequest({
    //     destinationName: "WM_BUSINESSRULES_REPO"

    // },
    //     {
    //         method: 'get',
    //         url: `/rest/v1/projects/${id}/rules`
    //     });
    // const airframersTable = getairframer.data[0].DecisionTable.Cell.filter(el => el.ColumnId === '1');
    // const airframersDetails = airframersTable.map(el => el.AST.find(el => el.Id === '3'));
    // const airframersList = airframersDetails.map(el => {return {email: el.Value}});

    // await INSERT (airframersList) .into (airframers);


}