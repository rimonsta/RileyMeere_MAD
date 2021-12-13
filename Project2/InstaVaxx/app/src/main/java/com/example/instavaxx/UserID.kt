package com.example.instavaxx

import android.widget.EditText

data class UserID(var nametag: String = "") {
    fun createNametag(firstName: EditText, middleInitial: EditText, lastName: EditText) {
        val firstNameString = firstName.text.toString()
        val middleInitialString = middleInitial.text.toString()
        val lastNameString = lastName.text.toString()
        nametag = "$firstNameString $middleInitialString $lastNameString"
    }
}
