import React,{useState,createContext} from 'react';
import logo from '../../assets/logo.jpeg';
import Modal from 'react-modal';
import './Header.css'
import Login from '../../screens/login/Login';
import PropTypes from 'prop-types';
import {Tabs,Tab,Box,Button,Typography} from '@material-ui/core';
import Register from '../../screens/register/Register';

export const AuthContext = createContext({close:()=>{},login:()=>{}})

const Header = () => {

    const [modalIsOpen, setModalIsOpen] = useState(false);
    const [userLogin, setUserLogin] = useState(false);

    const openModal = () => setModalIsOpen(true);
    const closeModal = () => setModalIsOpen(false);
  
  const login = () => setUserLogin(true);
  const logout = () => setUserLogin(false);

    
    const customStyles = {
        content: {
          top: '50%',
          left: '50%',
          right: 'auto',
            bottom: 'auto',
          padding: '0',
          marginRight: '-50%',
            transform: 'translate(-50%, -50%)',
        },
      };

    return (
        <div className="headerContainer">
        <img src={logo} alt="Service logo" className="logo" />
            { !userLogin &&<><Button className="loginLogoutButton" variant="contained" color="primary" onClick={openModal}>Login</Button>
            <Modal
                isOpen={modalIsOpen}
                onAfterOpen={openModal}
                onRequestClose={closeModal}
                style={customStyles}
                contentLabel="Login/Register Tab"
                ariaHideApp={false}
            >
          <Typography style={{ backgroundColor: "purple", color: "white", padding: "30px 80px 30px 5px " }} variant="h5">Authentication</Typography>
          <AuthContext.Provider value={{ close: closeModal, login: login }}>
            <BasicTabs />
          </AuthContext.Provider>
        </Modal></>}
        
            {userLogin && <Button onClick={logout} className="loginLogoutButton" variant="contained" color="secondary">Logout</Button>}
        </div>
    )
}
export default Header;





const TabPanel=props=> {
  const { children, value, index, ...other } = props;

  return (
    <div
      role="tabpanel"
      hidden={value !== index}
      id={`simple-tabpanel-${index}`}
      aria-labelledby={`simple-tab-${index}`}
      {...other}
    >
      {value === index && (
        <Box sx={{ p: 3  }}>
          <Typography>{children}</Typography>
        </Box>
      )}
    </div>
  );
}

TabPanel.propTypes = {
  children: PropTypes.node,
  index: PropTypes.number.isRequired,
  value: PropTypes.number.isRequired,
};

function a11yProps(index) {
  return {
    id: `simple-tab-${index}`,
    'aria-controls': `simple-tabpanel-${index}`,
  };
}

export function BasicTabs() {
  const [value, setValue] = useState(0);

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  return (
    <Box sx={{ width: '100%' }}>
      <Box sx={{ borderBottom: 1, borderColor: 'divider' }}>
        <Tabs value={value} onChange={handleChange} aria-label="basic tabs example">
          <Tab label="Login" {...a11yProps(0)} />
          <Tab label="Register" {...a11yProps(1)} />
        </Tabs>
      </Box>
      <TabPanel value={value} index={0}>
        <Login/>
      </TabPanel>
      <TabPanel value={value} index={1}>
        <Register/>
      </TabPanel>
    </Box>
  );
}