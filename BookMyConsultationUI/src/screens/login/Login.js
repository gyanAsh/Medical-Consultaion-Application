import React,{useState} from 'react';
import {FormControl,InputLabel,Input,Button} from '@material-ui/core'

const Login = () => {
    const [userEmail, setUserEmail] = useState("");
    const [userPassword, setUserPassword] = useState("");
    const handleSubmit = (e) => {
        e.preventDefault();
        const data = { userEmail, userPassword };
        console.log(data);
        fetch('/auth/login', {
            method: 'POST',
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(data)
        }).then(()=> console.log("Login data send"))

    }
    return (
        <form onSubmit={handleSubmit}style={{display:"flex",flexDirection:"column",justifyContent:"center", gap:"20px"}}>
            <FormControl variant="standard">
                <InputLabel htmlFor="email">Email</InputLabel>
                <Input type="email" id="email" onChange={e => setUserEmail(e.target.value)} />
            </FormControl>
            <FormControl variant="standard">
                <InputLabel htmlFor="password">Password</InputLabel>
                <Input type="password" id="password" onChange={e => setUserPassword(e.target.value)} />
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

export default Login;