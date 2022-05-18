import React, { useState } from 'react';
import { FormControl, InputLabel, Input, Button } from '@material-ui/core'

const Register = () => {
    const [firstName, setFirstName] = useState("");
    const [lastName, setLastName] = useState("");
    const [mobile, setMobile] = useState("");
    const [password, setPassword] = useState("");
    const [emailId, setEmail] = useState("");

    const handleSubmit = (e) => {
        e.preventDefault();
        const data = { firstName, lastName, mobile, password, emailId };
        console.log({ data });
        fetch('/users/register', {
            method: 'POST',
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(data)
        }).then(() => console.log("User data send")).catch(e => console.log(`Error: ${e.message}`));

    }
    return (
        <form onSubmit={handleSubmit} style={{ display: "flex", flexDirection: "column", justifyContent: "center", gap: "20px" }}>
            <FormControl required="true" variant="standard">
                <InputLabel htmlFor="firstName">First Name</InputLabel>
                <Input id="firstName" onChange={e => setFirstName(e.target.value)} />
            </FormControl>
            <FormControl required="true" variant="standard">
                <InputLabel htmlFor="lastName">Last Name</InputLabel>
                <Input id="lastName" onChange={e => setLastName(e.target.value)} />
            </FormControl>
            <FormControl required="true" variant="standard">
                <InputLabel htmlFor="emailId">Email Id</InputLabel>
                <Input type="email" id="emailId" onChange={e => setEmail(e.target.value)} />
            </FormControl>
            <FormControl required="true" variant="standard">
                <InputLabel htmlFor="password">Password</InputLabel>
                <Input type="password" id="password" onChange={e => setPassword(e.target.value)} />
            </FormControl>
            <FormControl required="true" variant="standard">
                <InputLabel htmlFor="mobile">Mobile No.</InputLabel>
                <Input type="number" id="mobile" onChange={e => setMobile(e.target.value)} />
            </FormControl>
            <Button
                variant="contained"
                color="primary"
                type="submit"
                className="button-block"
            >
                Login
            </Button>
        </form>
    )
}

export default Register;