//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract TareasCrud {
    
    struct Tarea {
        uint id;
        string name;
        string description;
    }
    
    Tarea[] tareas;
    uint nextId; // default value 0, add public to see the value
    
    function createTaread(string memory _name, string memory _description) public {
        tareas.push(Tarea(nextId, _name, _description));
        nextId++;
    }
    
    
    function findIndex(uint _id) internal view returns (uint) {
        for (uint i = 0; i < tareas.length; i++) {
            if (tareas[i].id == _id) {                
                return i;
            }
        }
        revert("Tarea no encontrada");
    }
    
    function updateTarea(uint _id, string memory _name, string memory _description) public {
        uint index =  findIndex(_id);
        tareas[index].name = _name;
        tareas[index].description = _description;
    }
    
    function readTarea(uint _id) public view returns (uint, string memory, string memory) {
        uint index = findIndex(_id);
        return (tareas[index].id, tareas[index].name, tareas[index].description);
    }
    
    function deleteTarea(uint _id) public {
        uint index = findIndex(_id);
        delete tareas[index];
    }
    
}
