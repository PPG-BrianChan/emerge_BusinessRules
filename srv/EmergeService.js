const syncClientLink = require('./libs/syncClientLink.js');
const getAirframers = require('./libs/getAirframers.js');
const getPrograms = require('./libs/getPrograms.js');
const getComponents = require('./libs/getComponents.js');

module.exports = function (service) {

    var { ProductSurvey, Airframer, Program, Component } = service.entities;

    this.before('READ', 'Airframer', async (req,) => {
        await getAirframers(req, Airframer, service);
        // await service.insert(getAirframers(req, Airframer)) .into (Airframer);
    })

    this.before('READ', 'Program', async (req) => {
        // return getPrograms(req, Program,);
        await getPrograms(req, Program, service);
    })

    this.before('READ', 'Component', async (req) => {
        // return getComponents(req, Component,);
        await getComponents(req, Component, service);
    })

    // this.after('CREATE', ProductSurvey, async (req) => {
    //     try {
    //         const syncClientLinkRequest = await syncClientLink(req);
    //     }
    //     catch (error) {
    //         req.reject({
    //             message: error.message
    //         });
    //     }
    // })
}