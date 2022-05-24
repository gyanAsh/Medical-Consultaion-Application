import React, { useState, useEffect } from 'react';
import { Typography, Paper,Button } from '@material-ui/core';
import Modal from 'react-modal';
import RateAppointment from './RateAppointment';

const Appointment = ({ loggedInToken }) => {
    const loggedInUser = JSON.parse(sessionStorage.getItem("consultation-user"));
    const [appointments, setAppointments] = useState([]);

    const [modalIsOpenRating, setModalIsOpenRating] = useState(false);
    const [appointmentInfo, setAppointmentInfo] = useState({});

    const openModalRating = () => setModalIsOpenRating(true);
    const closeModalRating = () => setModalIsOpenRating(false);

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

    useEffect(() => {
        getAppointments();
    })

    const getAppointments = () => {
        if (loggedInToken == null || loggedInUser==null)
            return;
        
        fetch(`http://localhost:8080/users/${loggedInUser.id}/appointments`, {
            method: 'GET',
            headers: {
                'Authorization': `Bearer ${loggedInToken}`
            }
        }).then(res => res.json())
            .then(data => setAppointments(data))
            .catch(err => console.log(err.message));
    }
    
    return (
        <div>
            {(loggedInToken == null) && <Typography variant="h3" align="center">Login to see appointments</Typography>}
            {!(loggedInToken == null) && appointments.map(appointment => (
                <Paper key={appointment.appointmentId} elevation={5} align="left" style={{ width:"90%",margin:15,padding:20,cursor: "pointer"}}>
                    <Typography variant="h6" style={{ paddingLeft: 11, paddingRight: 11 }}>Dr: {appointment.doctorName}</Typography>
                    <Typography variant="h6" style={{ paddingLeft: 11, paddingRight: 11 }}>Date: {appointment.appointmentDate} </Typography>
                    <Typography variant="h6" style={{ paddingLeft: 11, paddingRight: 11 }}>Symptoms: {appointment.symptoms} </Typography>
                    <Typography variant="h6" style={{ paddingLeft: 11, paddingRight: 11 }}>priorMedicalHistory: {appointment.priorMedicalHistory}</Typography>
                    <Button onClick={() => { setAppointmentInfo(appointment); openModalRating() }} style={{ minWidth: "10%", margin: "10px", color: "white" }} variant="contained" color="primary">
                    RATE APPOINTMENT
                    </Button>
                </Paper>
            ))}
            <Modal
                            isOpen={modalIsOpenRating}
                            onAfterOpen={openModalRating}
                            onRequestClose={closeModalRating}
                            style={customStyles}
                            contentLabel="RATE APPOINTMENT"
                                ariaHideApp={false}
                            >
                                <RateAppointment  appointmentInfo={appointmentInfo} loggedInToken={loggedInToken} closeModalRating={closeModalRating} />
                </Modal>
        </div>
    )
}

export default Appointment;