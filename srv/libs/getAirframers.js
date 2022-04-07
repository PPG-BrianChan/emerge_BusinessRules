const { executeHttpRequest } = require('@sap-cloud-sdk/core');

module.exports = async function (req, airframers) {
    const id = '2bcf29efe00f41118850dbd9ac273218';
    
    try {
        var payload = JSON.stringify({
            "RuleServiceId": "2bcf29efe00f41118850dbd9ac273218",
            "Vocabulary": [
              {}
            ]
          });

          const response = await executeHttpRequest(
            {
              destinationName: "BUSINESS_RULES",
            },
            { method: "POST", data: payload, url: "/rest/v1/workflow-instances" }
          );
        
          console.log(response.data);

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
    catch (error) {
        console.log(error.message)
    }

}