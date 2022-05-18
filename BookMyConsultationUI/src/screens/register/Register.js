import React, { useState,useEffect } from 'react';
import { FormControl, InputLabel, Input, Button,FormHelperText,Typography } from '@material-ui/core'

const Register = () => {
    const [firstName, setFirstName] = useState("");
    const [lastName, setLastName] = useState("");

    const [mobile, setMobile] = useState("");
    const [userMobileErrMsg,setUserMobileErrMsg] = useState("");
    const [mobileErr, setMobileErr] = useState(false);
    
    const [password, setPassword] = useState("");

    const [emailId, setEmail] = useState("");
    const [userEmailErrMsg, setUserEmailErrMsg] = useState("");
    const [EmailErr, setEmailErr] = useState(false);

    const [registerSuccess, setRegisterSuccess] = useState(false);

    useEffect(() => {
        setUserEmailErrMsg("");
        setEmailErr(false);
    }, [emailId])

    useEffect(() => {
        setUserMobileErrMsg("");
        setMobileErr(false);
    },[mobile])
    

    const handleSubmit = (e) => {
        e.preventDefault();

        if (!emailId.includes('@') || emailId.endsWith('@')) {
            setUserEmailErrMsg("Enter valid Email");
            setEmailErr(true);
            return;
        }
        if (mobile.length !== 10) {
            setUserMobileErrMsg("Enter valid mobile number");
            setMobileErr(true);
            return;
        }

        const data = { firstName, lastName, mobile, password, emailId };
        fetch('/users/register', {
            method: 'POST',
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(data)
        }).then((res) => {
            if (res.status !== 200)
                throw new Error("Registration Unsuccessful");
            
            setRegisterSuccess(true);
        }).catch(e => {
            console.log(`Error: ${e.message}`)
        });

    }
    return (
        <form onSubmit={handleSubmit} style={{ display: "flex", flexDirection: "column", justifyContent: "center", gap: "20px" }}>
            {!registerSuccess && ( <><FormControl required="true" variant="standard">
                <InputLabel htmlFor="firstName">First Name</InputLabel>
                <Input id="firstName" onChange={e => setFirstName(e.target.value)} />
            </FormControl>
            <FormControl required="true" variant="standard">
                <InputLabel htmlFor="lastName">Last Name</InputLabel>
                <Input id="lastName" onChange={e => setLastName(e.target.value)} />
            </FormControl>
            <FormControl required="true" variant="standard">
                <InputLabel htmlFor="emailId">Email Id</InputLabel>
                <Input id="emailId" onChange={e => setEmail(e.target.value)} />
                <FormHelperText error={EmailErr}>{userEmailErrMsg}</FormHelperText>
            </FormControl>
            <FormControl required="true" variant="standard">
                <InputLabel htmlFor="password">Password</InputLabel>
                <Input type="password" id="password" onChange={e => setPassword(e.target.value)} />
            </FormControl>
            <FormControl required="true" variant="standard">
                <InputLabel htmlFor="mobile">Mobile No.</InputLabel>
                <Input type="number" id="mobile" onChange={e => setMobile(e.target.value)} />
                <FormHelperText error={mobileErr}>{userMobileErrMsg}</FormHelperText>
            </FormControl>
            <Button
                variant="contained"
                color="primary"
                type="submit"
                className="button-block"
            >
                REGISTER
                </Button></>)}
            {registerSuccess && (<>
                <Typography variant="h5" align="center"
                    style={{ padding:"50px 0px" }} >
                    'Registration Successful'
                </Typography>
            </>)}
        </form>
    )
}

export default Register;