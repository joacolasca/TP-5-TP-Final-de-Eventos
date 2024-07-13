import express from "express";  
import cors from "cors"; 

import RouterEvent from "./src/controllers/event-controller.js"
import RouterUser from "./src/controllers/user-controller.js"
import RouterProvince from "./src/controllers/province-controllers.js"
import RouterLocation from "./src/controllers/location-controller.js"
import RouterCategory from"./src/controllers/category-controllers.js" 
import RouterEventLocation from"./src/controllers/event-location-controller.js" 

const app = express(); 
const port = 3002; 
app.use(cors()); 
app.use(express.json());

app.use("/api/event", RouterEvent);
app.use("/api/user", RouterUser);
app.use("/api/province", RouterProvince);
app.use("/api/location", RouterLocation);
app.use("/api/event-category", RouterCategory);
app.use("/api/event-location", RouterEventLocation);

// app.use("/api/rating_eventos", Router10);


app.listen(port,() => { 
    console.log(`Example app listening on port ${port}`) 
})