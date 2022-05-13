import React from 'react';
import logo from '../../assets/logo.jpeg';
import Button from '@mui/material/Button'
import './Header.css'

const Header = () => {
    return (
        <div className="headerContainer">
            <img src={logo} alt="Service logo" className="logo" />
            <Button className="loginLogoutButton" variant="contained" color="primary">Login</Button>
            <Button className="loginLogoutButton" variant="contained" color="secondary">Logout</Button>

        </div>
    )
}
export default Header;