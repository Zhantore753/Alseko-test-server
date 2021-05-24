const Router = require('express');
const router = new Router();
const materialController = require('../controllers/materialController');

router.post('/material', materialController.createMaterial);
router.get('/material', materialController.getMaterialsByPerson);
router.put('/material', materialController.updateMaterial);
router.delete('/material/:id', materialController.deleteMaterial);

module.exports = router;