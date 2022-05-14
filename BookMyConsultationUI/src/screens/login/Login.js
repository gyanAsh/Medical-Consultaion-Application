import React,{useState} from 'react';
import {FormControl,InputLabel,Input,Button} from '@material-ui/core'

const Login = () => {
    const [userEmail, setUserEmail] = useState("");
    const [userPassword, setUserPassword] = useState("");
    const handleSubmit = (e) => {
        e.preventDefault();
        const data = { userEmail, userPassword };
        console.log(data);
        fetch('http://localhost:8080/auth/login', {
            method: 'POST',
            header: { "Content-Type": "application/json" },
            body: JSON.stringify(data)
        }).then(()=> console.log("User data send"))

    }
    return (
        <form onSubmit={handleSubmit}style={{display:"flex",flexDirection:"column",justifyContent:"center", gap:"20px"}}>
            <FormControl variant="standard">
                <InputLabel htmlFor="email">Email</InputLabel>
                <Input id="email" onChange={e => setUserEmail(e.target.value)} />
            </FormControl>
            <FormControl variant="standard">
                <InputLabel htmlFor="password">Password</InputLabel>
                <Input id="password" onChange={e => setUserPassword(e.target.value)} />
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