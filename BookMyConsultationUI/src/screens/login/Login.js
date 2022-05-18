import React,{useState,useContext , useEffect} from 'react';
import { FormControl, InputLabel, Input, Button, FormHelperText } from '@material-ui/core'
import { AuthContext } from '../../common/header/Header';


const Login = () => {
    const [userEmail, setUserEmail] = useState("");
    const [userEmailErrMsg, setUserEmailErrMsg] = useState("");
    const [EmailErr, setEmailErr] = useState(false);
    
    const [userPassword, setUserPassword] = useState("");
    const auth = useContext(AuthContext);

    useEffect(() => {
        setUserEmailErrMsg("");
        setEmailErr(false);
    }, [userEmail])
    
    
    const api = 'http://localhost:8080/auth/login';
    const handleSubmit = (e) => {
        e.preventDefault();

        if (!userEmail.includes('@') || userEmail.endsWith('@')) {
            setUserEmailErrMsg("Enter valid Email");
            setEmailErr(true);
            return;
        }

        fetch(api, {
            method: 'POST',
            headers: {
                "Authorization": `Basic ${Buffer.from(`${userEmail}:${userPassword}`).toString('base64')}`
            }
        }).then(res => {
            if (res.status !== 200)
                throw new Error(res.json());
            
            return res.json();
        }).then(data => {
                const accessToken = data.accessToken;
                const id = data.id;
                localStorage.setItem(id, accessToken);
                auth.login();
                auth.close();
            }).catch(err => console.log(`Error: ${err.message}`));


    }
    return (
        <form onSubmit={handleSubmit} style={{ display: "flex", flexDirection: "column", justifyContent: "center", gap: "20px" }}>
            <FormControl  required="true" variant="standard">
                <InputLabel htmlFor="email">Email</InputLabel>
                <Input value={userEmail} id="email" onChange={e => setUserEmail(e.target.value)} />
                <FormHelperText error={EmailErr}>{userEmailErrMsg}</FormHelperText>
            </FormControl>
            <FormControl required="true" variant="standard">
                <InputLabel  htmlFor="password">Password</InputLabel>
                <Input value={userPassword}  type="password" id="password" onChange={e => setUserPassword(e.target.value)} />
            </FormControl>
            <Button
                variant="contained"
                color="primary"
                type="submit"
                className="button-block"
                >
            LOGIN
            </Button>
        </form>
    )
}

export default Login;