// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.7.4;

contract SimpleStorage {
    
    event CreazionePostazione(bool esito);
    event EliminazionePostazione(bool esito);
    
 struct Postazione {
     uint x;
     uint y;
     bool isExist;
 }
 
 //dati della stanza
 uint dim1;
 uint dim2;
 mapping (string => Postazione) public postazioni; 
 
 // marcare mapping PUBLIC rende disponibile il getter aGGRATIS
 
 //serve una lista degli id delle postazioni per eliminare tutte le postazioni della stanza
 //altrimenti si crea garbage
 
 function _setDimensioniStanza(uint _dim1, uint _dim2) public {
     dim1=_dim1;
     dim2=_dim2;
 }
 
 function _creaPostazione (string memory _id, uint _x, uint _y) public {
     postazioni[_id]=Postazione(_x, _y, true);
     emit CreazionePostazione(postazioni[_id].isExist);
 }
 
 function _eliminaPostazione (string memory _id) public {
     delete postazioni[_id];
     emit CreazionePostazione(postazioni[_id].isExist);
 }
    
}
    