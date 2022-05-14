import React,{useState} from 'react';
import {FormControl,InputLabel,Input,Button} from '@material-ui/core'

const Login = () => {
    const [userEmail, setUserEmail] = useState("");
    const [userPassword, setUserPassword] = useState("");
    const handleSubmit = (e) => {
        e.preventDefault();
        // console.log(`${userEmail} test print  ${userPassword}`);

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