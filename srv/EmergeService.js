const syncClientLink = require('./libs/syncClientLink.js');
const getAirframers = require('./libs/getAirframers.js');

module.exports = function (service) {

    var { ProductSurvey, Airframers } = service.entities;

    this.before('READ', Airframers, async (req) => {
        await getAirframers(req, Airframers);
    })

    this.after('CREATE', ProductSurvey, async (req) => {
        try {
            const syncClientLinkRequest = await syncClientLink(req);
        }
        catch (error) {
            req.reject({
                message: error.message
            });
        }
    })
}