import React,{useState} from 'react';
import {FormControl,InputLabel,Input,Button} from '@material-ui/core'

const Register = () => {
    const [firstName, setFirstName] = useState("");
    const [lastName, setLastName] = useState("");
    const [dob, setDob] = useState("");
    const [mobile, setMobile] = useState("");
    const [password, setPassword] = useState("");
    const [emailId, setEmail] = useState("");

    const handleSubmit = (e) => {
        e.preventDefault();
        const data = { firstName,lastName,dob,mobile,password,emailId};
        console.log(data);
        fetch('http://localhost:8080/users/register', {
            method: 'POST',
            header: { "Content-Type": "application/json" },
            body: JSON.stringify(data)
        }).then(()=> console.log("User data send"))

    }
    return (
        <form onSubmit={handleSubmit} style={{ display: "flex", flexDirection: "column", justifyContent: "center", gap: "20px" }}>
            <FormControl variant="standard">
                <InputLabel htmlFor="password">First Name</InputLabel>
                <Input id="password" onChange={e => setFirstName(e.target.value)} />
            </FormControl>
            <FormControl variant="standard">
                <InputLabel htmlFor="password">Last Name</InputLabel>
                <Input id="password" onChange={e => setLastName(e.target.value)} />
            </FormControl>
            <FormControl variant="standard">
                <InputLabel htmlFor="password">Date of Birth</InputLabel>
                <Input id="password" onChange={e => setDob(e.target.value)} />
            </FormControl>
            <FormControl variant="standard">
                <InputLabel htmlFor="password">Email Id</InputLabel>
                <Input id="password" onChange={e => setEmail(e.target.value)} />
            </FormControl>
            <FormControl variant="standard">
                <InputLabel htmlFor="password">Password</InputLabel>
                <Input id="password" onChange={e => setPassword(e.target.value)} />
            </FormControl>
            <FormControl variant="standard">
                <InputLabel htmlFor="email">Mobile No.</InputLabel>
                <Input id="email" onChange={e => setMobile(e.target.value)} />
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