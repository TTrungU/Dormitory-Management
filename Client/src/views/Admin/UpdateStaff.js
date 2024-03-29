import React, { useState } from "react";
import { InputLabel, MenuItem, FormControl, Select } from "@mui/material";

import {
  Form,
  Row,
  FormGroup,
  Col,
  Input,
  Button,
  Modal,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Label,
} from "reactstrap";

function UpdateStaff(props) {
  let staff = props.currentObject;
  const [state, setState] = useState({
    id: staff.ObjectEdit.id,
    lastName: staff.ObjectEdit.lastName,
    firstName: staff.ObjectEdit.firstName,
    dateOfBirth: staff.ObjectEdit.dateOfBirth,
    email: staff.ObjectEdit.email,
    identiFyCardNumber: staff.ObjectEdit.identiFyCardNumber,
    phoneNumber: staff.ObjectEdit.phoneNumber,
    address: staff.ObjectEdit.address,
    gender: staff.ObjectEdit.gender,
    idCard: staff.ObjectEdit.idCard,
    status: staff.ObjectEdit.status,
  });
  const handleOnchangeInput = (event, item) => {
    let copyState = { ...state };
    console.log("check event: ", event);
    if (event.target.value == "true" && item == "gender") {
      copyState["gender"] = true;
    } else if (event.target.value == "false" && item == "gender") {
      copyState["gender"] = false;
    } else if (event.target.value == "true" && item == "status") {
      copyState["status"] = true;
    } else if (event.target.value == "false" && item == "status") {
      copyState["status"] = false;
    } else {
      copyState[item] = event.target.value;
    }
    setState({
      ...copyState,
    });
  };
  const checkValideInput = () => {
    let isValid = true;
    let arrInput = [
      "lastName",
      "firstName",
      "dateOfBirth",
      "identiFyCardNumber",
      "phoneNumber",
      "address",
    ];
    for (let i = 0; i < arrInput.length; i++) {
      console.log("check inside loop", state[arrInput[i]], arrInput[i]);
      if (!state[arrInput[i]]) {
        isValid = false;
        alert("Missing parameter: " + arrInput[i]);
        break;
      }
    }
    return isValid;
  };
  const handleUpdateStaff = () => {
    let isValid = checkValideInput();
    if (isValid === true) {
      props.updateObject(state);
      console.log("check data modalUpdate: ", state);
      // { lastName: 'df', firstName: 'sdf', dateOfBirth: '2022-12-03', email: 'test1@gmail.com', identiFyCardNumber: '123', phoneNumber: '12345', address: '12345', gender: true, status: true }
    }
  };
  return (
    <div>
      <Modal isOpen={props.modal} fade={false} toggle={props.toggle}>
        <ModalHeader>Cập nhật thông tin</ModalHeader>
        <ModalBody>
          <Form>
            <FormGroup>
              <Label for="lastName">Tên</Label>
              <Input
                id="lastName"
                name="lastName"
                onChange={(event) => handleOnchangeInput(event, "lastName")}
                value={state.lastName}
              />
            </FormGroup>
            <FormGroup>
              <Label for="LastName">Họ và Tên lót</Label>
              <Input
                id="firstName"
                name="firstName"
                onChange={(event) => handleOnchangeInput(event, "firstName")}
                value={state.firstName}
              />
            </FormGroup>
            <FormGroup>
              <Label for="dateOfBirth">Ngày sinh</Label>
              <Input
                id="dateOfBirth"
                name="dateOfBirth"
                type="date"
                onChange={(event) => handleOnchangeInput(event, "dateOfBirth")}
                value={state.dateOfBirth}
              />
            </FormGroup>
            <FormGroup>
              <Label for="email">Email</Label>
              <Input
                id="email"
                name="email"
                onChange={(event) => handleOnchangeInput(event, "email")}
                value={state.email}
              />
            </FormGroup>
            <FormGroup>
              <Label for="identiFyCardNumber">CMND/ CCCD</Label>
              <Input
                id="identiFyCardNumber"
                name="identiFyCardNumber"
                onChange={(event) =>
                  handleOnchangeInput(event, "identiFyCardNumber")
                }
                value={state.identiFyCardNumber}
              />
            </FormGroup>
            <FormGroup>
              <Label for="phoneNumber">Số điện thoại</Label>
              <Input
                id="phoneNumber"
                name="phoneNumber"
                onChange={(event) => handleOnchangeInput(event, "phoneNumber")}
                value={state.phoneNumber}
              />
            </FormGroup>
            <FormGroup>
              <Label for="address">Địa chỉ</Label>
              <Input
                id="address"
                name="address"
                onChange={(event) => handleOnchangeInput(event, "address")}
                value={state.address}
              />
            </FormGroup>
            {/* idCard */}
            <FormGroup>
              <Label for="idCard">MSNV</Label>
              <Input
                id="idCard"
                name="idCard"
                onChange={(event) => handleOnchangeInput(event, "idCard")}
                value={state.idCard}
              />
            </FormGroup>
            <FormGroup>
              <Label for="gender">Giới tính</Label>
              <FormControl style={{ width: "100%", maxWidth: "unset" }}>
                <Select
                  name={"gender"}
                  id="gender"
                  value={state.gender}
                  style={{ width: "100%", maxWidth: "unset" }}
                  onChange={(event) => handleOnchangeInput(event, "gender")}
                >
                  <MenuItem value={false}>Nữ</MenuItem>
                  <MenuItem value={true}>Nam</MenuItem>
                </Select>
              </FormControl>
            </FormGroup>
            {/* <Label for="status">Tình trạng</Label>
            <FormGroup>
              <select
                onChange={(event) => handleOnchangeInput(event, "status")}
              >
                <option value={true}>Đang làm</option>
                <option value={false}>Đã nghỉ</option>
              </select>
            </FormGroup> */}
            <FormGroup>
              <FormControl style={{ width: "100%", maxWidth: "unset" }}>
                <Label>Tình trạng làm việc</Label>
                <Select
                  name={"status"}
                  id="status"
                  value={state.status}
                  style={{ width: "100%", maxWidth: "unset" }}
                  onChange={(event) => handleOnchangeInput(event, "status")}
                >
                  <MenuItem value={false}>Đã nghỉ</MenuItem>
                  <MenuItem value={true}>Đang làm</MenuItem>
                </Select>
              </FormControl>
            </FormGroup>
            <div className="modalConfirmationControlButtons">
              <Button color="secondary" onClick={props.toggle}>
                Quay lại
              </Button>
              <Button color="primary" onClick={() => handleUpdateStaff()}>
                Cập nhật
              </Button>
            </div>
          </Form>
        </ModalBody>
        {/* Nút tắt phần modal */}
        {/* <ModalFooter>
                    <Button color="primary" onClick={props.toggle}>
                        Create
                    </Button>{' '}
                    <Button color="secondary" onClick={props.toggle}>
                        Cancel
                    </Button>
                </ModalFooter> */}
      </Modal>
    </div>
  );
}

export default UpdateStaff;
