import React, { useState, useEffect} from 'react';
import { Card, CardContent, Typography, Button, TextField,Select,MenuItem,FormHelperText } from '@material-ui/core';
import { MuiPickersUtilsProvider,KeyboardDatePicker } from '@material-ui/pickers'
import DateFnsUtils from '@date-io/date-fns';

const BookAppointment = ({ doc, loggedInToken }) => {
  
  const loggedInUser = JSON.parse(sessionStorage.getItem("consultation-user"));

  const DocFullName = doc.firstName + " " + doc.lastName;

  const [appointmentDate, setSelectedDate] = useState(new Date().toISOString().split('T')[0]);
  const [timeSlot, setTime] = useState("");
  const [priorMedicalHistory, setMedicationHistory] = useState("NA");
  const [symptoms, setSymptoms] = useState("TEST");
  const [timeSlotErr, setTimeSlotErr] = useState("")
  
  useEffect(() => {
    setTimeSlotErr("");
  }, [timeSlot])

  const handleDateChange = (e) => {
    setSelectedDate(e);
  };
  const handleTimeChange = (e) => {
    setTime(e.target.value);
  }
  const handleSymptomChange = (e) => {
    setSymptoms(e.target.value);
  }
  const handleMedicalHistoryChange = (e) => {
    setMedicationHistory(e.target.value);
  }


  const handleBookAppointment = (e) => {
    e.preventDefault();

    if (loggedInUser == null || loggedInToken == null) {
      alert("User not logged in");
      return;
    }
    if (timeSlot === "") {
      setTimeSlotErr("Select a time slot");
      return;
    }
    
    const appointmentData = { 
      "doctorId": doc.id,
    "doctorName": DocFullName,
    "userId": loggedInUser.id,
    "userName": loggedInUser.firstName+" "+loggedInUser.lastName,
    "userEmailId": loggedInUser.emailAddress,
    "timeSlot": timeSlot,                                                                   
    "appointmentDate": appointmentDate,                                          
    "createdDate": "",
    "symptoms": symptoms,
    "priorMedicalHistory": priorMedicalHistory
    }

    fetch('http://localhost:8080/appointments', {                                    
      method: 'POST',
      headers: {
        "Content-Type": "application/json",    
    'Authorization': `Bearer ${loggedInToken}`  },
      body: JSON.stringify(appointmentData)
    }).then(res => {
      if (res.status !== 200)
        throw new Error("Either the slot is already booked or not available");

      return res.text();
    }).then(data => {
      console.log(`New Appointment Id: ${data}`);
    }).catch(err => {
      alert(err.message);
      console.log(err);
    });

    
  }
  return (

    <Card style={{ width: 650}}>
      <Typography style={{height:70, backgroundColor: "purple", color: "white", padding: "11px",display: "flex",alignItems: "center"}} variant="h5">Book an Appointment</Typography>
      <form onSubmit={handleBookAppointment}>
      
      <CardContent style={{ padding: 20, display: 'flex', flexDirection: 'column', gap: 20 }}>
        <TextField
          disabled
          id="standard-disabled"
          label="DoctorName*"
          defaultValue={DocFullName}
          variant="standard"
          style={{width:200}}
          InputProps={{
            readOnly: true,
          }}
        />
        <MuiPickersUtilsProvider utils={DateFnsUtils}>
            <KeyboardDatePicker
              disableToolbar
              variant="inline"
              format="yyyy/MM/dd"
              margin="normal"
              id="date-picker-inline"
              label="Date picker inline"
              value={appointmentDate}
            onChange={handleDateChange}
            style={{width:200}}
              KeyboardButtonProps={{
                'aria-label': 'change date',
            }} />
        </MuiPickersUtilsProvider>
        <Select
          value={timeSlot}
          onChange={handleTimeChange}
          label="Timeslot"
          style={{width:200}}
          inputProps={{ 'aria-label': 'Without label' }}
        >
          <MenuItem value="">
            <em>None</em>
          </MenuItem>
          <MenuItem value="09AM-10AM">09AM-10AM</MenuItem>
          <MenuItem value="10AM-11AM">10AM-11AM</MenuItem>
          <MenuItem value="11AM-12PM">11AM-12PM</MenuItem>
          <MenuItem value="12PM-01PM">12PM-01PM</MenuItem>
          <MenuItem value="01PM-02PM">01PM-02PM</MenuItem>
          <MenuItem value="02PM-03PM">02PM-03PM</MenuItem>
          <MenuItem value="03PM-04PM">03PM-04PM</MenuItem>
          <MenuItem value="04PM-05PM">04PM-05PM</MenuItem>
          <MenuItem value="05PM-06PM">05PM-06PM</MenuItem>
          <MenuItem value="06PM-07PM">06PM-07PM</MenuItem>
          <MenuItem value="07PM-08PM">07PM-08PM</MenuItem>
          <MenuItem value="08PM-09PM">08PM-09PM</MenuItem>
          </Select>
          <FormHelperText error={true}>{timeSlotErr}</FormHelperText>
        <TextField
          id="standard-multiline-static"
            label="Medical History"
            value={priorMedicalHistory}
          multiline
          rows={4}
          style={{ width: 300 }}
          onChange={handleMedicalHistoryChange}
        />
        <TextField
          id="standard-multiline-static"
            label="Symptoms"
            value={symptoms}
          multiline
          rows={4}
          style={{ width: 300 }}
          onChange={handleSymptomChange}
        />
          
      </CardContent>
      <Button
          variant="contained"
          color="primary"
          type="submit"
          style={{margin:20}}>Book Appointment</Button>
        </form>
        </Card>
        )
}

        export default BookAppointment;