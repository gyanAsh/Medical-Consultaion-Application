import React, { useState,useEffect } from 'react';
import { Box, Paper, FormControl, Select, MenuItem, Typography,Button } from '@material-ui/core';
import { Rating } from '@material-ui/lab'
import Modal from 'react-modal';
import BookAppointment from './BookAppointment';
import DoctorDetails from './DoctorDetails';

const DoctorList = ({loggedInToken}) => {
    const [speciality, setSpeciality] = useState('');
    const [specialists, setSpecialists] = useState([]);
    const [doctorsList, setDoctorsList] = useState([]);

    const [modalIsOpenBookAppointment, setModalIsOpenBookAppointment] = useState(false);
    const [bookAppointment, setBookAppointment] = useState({});

    const openModalBookAppointment = () => setModalIsOpenBookAppointment(true);
    const closeModalBookAppointment = () => setModalIsOpenBookAppointment(false);

    const [modalIsOpenViewDetail, setModalIsOpenViewDetail] = useState(false);
    const [viewDetail, setViewDetail] = useState({});

    const openModalViewDetail = () => setModalIsOpenViewDetail(true);
    const closeModalViewDetail =()=> setModalIsOpenViewDetail(false);
    
        
    useEffect(() => {
        getDoctors();
        getSpecialties();
    }, [])
    
    useEffect(() => {
        getSpecialtyDoctor();
    },[speciality])

    const handleChange = (event) => {
        setSpeciality(event.target.value);
    };
    
    const getDoctors = () => {
        fetch('/doctors').then(res=> res.json()).then(data=>setDoctorsList(data)).catch(err=>console.error(err));
    }
    const getSpecialties = () => {
        fetch('/doctors/speciality').then(res => res.json()).then(data => setSpecialists(data)).catch(err => console.log(err));
    }
    const getSpecialtyDoctor = () => {
        fetch(`doctors?speciality=${speciality}`).then(res => res.json()).then(data => setDoctorsList(data)).catch(err => console.log(err));
    }
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
        <div style={{display: 'flex', alignItems: 'center', flexDirection: 'column'}}>
            <Typography variant="h6">Select Speciality :</Typography>
            <BasicSelect handleChange={handleChange} speciality={speciality} specialists={specialists}/>
            <Box
                sx={{
                    display: 'flex',
                    flexDirection: 'column',
                    // gap: 15,
                    m:3,
                    '& > :not(style)': {
                    m: 3,
                    width: 540,
                    height: 140,
                    },
                }}
            >
                {doctorsList.map(doctor => (
                    <Paper key={doctor.id} elevation={5} align="left" style={{margin:15,padding:20,cursor: "pointer"}} >
                        <Typography variant="h6" style={{paddingBottom:10}}>
                            Doctor Name : {doctor.firstName} {doctor.lastName}
                        </Typography>
                        <Typography sx={{ fontSize: 14 }}>
                            Speciality : {doctor.speciality}
                        </Typography>
                        <Typography sx={{ fontSize: 14 }}>
                            Rating :
                        <Rating name="half-rating" defaultValue={doctor.rating} precision={0.5} readOnly />
                        </Typography>
                        <Box sx={{ width: '100%' }}  >
                            <Button onClick={() => { setBookAppointment(doctor); openModalBookAppointment()}} style={{ minWidth: "40%", margin: "10px", color: "white" }} variant="contained" color="primary">Book Appointment</Button>
                            <Button onClick={() => { setViewDetail(doctor); openModalViewDetail()}} style={{ minWidth: "40%",margin:"10px",backgroundColor:"green", color:"white" }} variant="contained">View Details</Button>
                        </Box>
                    </Paper>
                ))}
                <Modal
                            isOpen={modalIsOpenBookAppointment}
                            onAfterOpen={openModalBookAppointment}
                            onRequestClose={closeModalBookAppointment}
                            style={customStyles}
                            contentLabel="Booking Appointment"
                                ariaHideApp={false}
                            >
                                <BookAppointment  doc={bookAppointment} loggedInToken={loggedInToken} />
                </Modal>
                <Modal
                            isOpen={modalIsOpenViewDetail}
                            onAfterOpen={openModalViewDetail}
                            onRequestClose={closeModalViewDetail}
                            style={customStyles}
                            contentLabel="View Details"
                                ariaHideApp={false}
                            >
                                <DoctorDetails  doc={viewDetail} />
                </Modal>
            </Box>
        </div>
    )
}

export default DoctorList;


export const BasicSelect=({handleChange,speciality,specialists})=> {
    
  
    return (
      <Box sx={{ minWidth: 150 }}>
        <FormControl fullWidth>
          <Select
            labelId="simple-select-label"
            id="simple-select"
            value={speciality}
            label="Age"
            onChange={handleChange}
            >
                {specialists.map(specialist =>
                <MenuItem key={specialist} value={specialist}>{specialist}</MenuItem>
            )}    
          </Select>
        </FormControl>
      </Box>
    );
  }