import React,{useState} from 'react';
import {FormControl,InputLabel,Input,Button} from '@material-ui/core'

const Login = () => {
    const [userEmail, setUserEmail] = useState("");
    const [userPassword, setUserPassword] = useState("");
    const api = 'http://localhost:8080/auth/login';
    const handleSubmit = (e) => {
        e.preventDefault();
        const data = { userEmail, userPassword };
        console.log(data);
        fetch(api, {
            method: 'POST',
            headers: {
                "Authorization": `Basic ${Buffer.from(`${userEmail}:${userPassword}`).toString('base64')}`
            }
        }).then(res => res.json())
            .then(data => {
                console.log(data)
                const accessToken = data.accessToken;
                const id = data.id;
                localStorage.setItem(id, accessToken);
                
            })
          .catch(err => console.log(`Error: ${err}`));


    }
    return (
        <form onSubmit={handleSubmit} style={{ display: "flex", flexDirection: "column", justifyContent: "center", gap: "20px" }}>
            <FormControl variant="standard">
                <InputLabel htmlFor="email">Email</InputLabel>
                <Input value={userEmail} required="true" type="email" id="email" onChange={e => setUserEmail(e.target.value)} />
            </FormControl>
            <FormControl variant="standard">
                <InputLabel htmlFor="password">Password</InputLabel>
                <Input value={userPassword} required="true" type="password" id="password" onChange={e => setUserPassword(e.target.value)} />
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