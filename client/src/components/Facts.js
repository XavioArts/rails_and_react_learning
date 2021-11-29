import React, {useEffect, useState} from "react";
import axios from "axios";

const Facts = () => {

    const [facts, setFacts] = useState([]);

    useEffect(() => {
        // get facts here
        getFacts();
    }, []);

    const getFacts = async () => {
        let result = await axios.get("/api/facts");
        // console.log(result.data);
        setFacts(result.data);
    }
    return (
        <div>
            <h1>Facts</h1>
            <p>facts will go here</p>
        </div>
    )
};

export default Facts;