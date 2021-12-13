package com.example.instavaxx

import android.annotation.TargetApi
import android.app.Activity
import android.app.DatePickerDialog
import android.content.Intent
import android.graphics.drawable.Drawable
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Window
import android.view.WindowManager
import android.view.inputmethod.EditorInfo
import android.view.inputmethod.InputMethodManager
import android.widget.*
import androidx.constraintlayout.widget.ConstraintLayout
import com.google.android.material.snackbar.Snackbar
import java.util.*
import android.widget.TextView

import android.widget.TextView.OnEditorActionListener




class MainActivity : AppCompatActivity() {
    lateinit var layoutRoot : ConstraintLayout
    lateinit var generateVaxCardButton: Button
    lateinit var firstName: EditText
    lateinit var middleInitial: EditText
    lateinit var lastName: EditText
    lateinit var dobTextView: EditText
    lateinit var vaccineRadioGroup: RadioGroup
    lateinit var firstSelection: RadioButton
    lateinit var secondSelection: RadioButton
    private var myUserID = UserID()

    override fun onCreate(savedInstanceState: Bundle?) {
        setTheme(R.style.splashScreenTheme)
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // views
        layoutRoot = findViewById(R.id.root_layout)
        generateVaxCardButton = findViewById(R.id.button)
        firstName = findViewById(R.id.editTextFirstName)
        middleInitial = findViewById(R.id.editTextMiddleInitial)
        lastName = findViewById(R.id.editTextLastName)
        dobTextView = findViewById(R.id.editTextDate)
        vaccineRadioGroup = findViewById(R.id.radioGroup)
        firstSelection = findViewById(R.id.radioButton)
        secondSelection = findViewById(R.id.radioButton2)

        // change action bar to drawable gradient
        // code help: https://www.geeksforgeeks.org/how-to-set-gradient-and-image-backgrounds-for-actionbar-in-android/
        supportActionBar?.setBackgroundDrawable(resources.getDrawable(R.drawable.app_bar_gradient))
        
        // event listener for last name edit text action (android:imeOptions="actionDone")
        // code help: https://stackoverflow.com/questions/11981740/how-to-lose-the-focus-of-a-edittext-when-done-button-in-the-soft-keyboard-is-p/54225663
        lastName.setOnEditorActionListener { v, actionId, event ->
            if (actionId == EditorInfo.IME_ACTION_DONE) {
                lastName.clearFocus()
            }
            false
        }

        // create default calendar date (minus 20 years because babies don't need proof of COVID vaccination)
        val c = Calendar.getInstance()
        val year = c.get(Calendar.YEAR) - 20
        val month = c.get(Calendar.MONTH)
        val day = c.get(Calendar.DAY_OF_MONTH)

        // event listener for DOB edit text
        dobTextView.setOnClickListener{
            // removes focus from edit text
            firstName.clearFocus()
            middleInitial.clearFocus()
            lastName.clearFocus()

            // creates date picker dialog
            // code help: http://www.sketchwarehelp.com/2019/06/datepickerdialog-with-different-themes.html
            //              https://stackoverflow.com/questions/64572241/android-date-picker-fragment-change-to-spinner
            val dpDialog = DatePickerDialog(this, android.R.style.Theme_Holo_Dialog, DatePickerDialog.OnDateSetListener
            {
                    view, mYear, mMonth, mDay -> dobTextView.setText(""+ (mMonth+1) +"/"+ mDay +"/"+ mYear)
            }, year, month, day)
            dpDialog.show()
        }

        // event listener for generate button
        generateVaxCardButton.setOnClickListener {
            // checks if required inputs are filled
            val vaccineID = vaccineRadioGroup.checkedRadioButtonId
            if (vaccineID == -1 || firstName.text.toString() == "" || lastName.text.toString() == "" || dobTextView.text.toString() == "") {
                val requiredInputSnackbar = Snackbar.make(layoutRoot, "'*' indicates a required input.", Snackbar.LENGTH_LONG)
                requiredInputSnackbar.show()
            }
            // creates intent to show vax card activity
            else {
                myUserID.createNametag(firstName, middleInitial, lastName)
                val intent = Intent(this, VaxCardActivity::class.java)
                intent.putExtra("userFullName", myUserID.nametag)
                startActivity(intent)
            }
        }

        // event listener for root layout (touch outside)
        layoutRoot.setOnClickListener {
            // hides soft keyboard on root layout click
            hideSoftKeyboard()

            // removes focus from edit text
            firstName.clearFocus()
            middleInitial.clearFocus()
            lastName.clearFocus()
        }
        // event listeners for radio group selection
//        firstSelection.setOnClickListener {
//            firstName.clearFocus()
//            middleInitial.clearFocus()
//            lastName.clearFocus()
//        }
//        secondSelection.setOnClickListener {
//            firstName.clearFocus()
//            middleInitial.clearFocus()
//            lastName.clearFocus()
//        }
    }

    // extension function to hide soft keyboard programmatically
    // code help: https://android--code.blogspot.com/2020/08/android-kotlin-edittext-hide-keyboard.html
    fun Activity.hideSoftKeyboard(){
        (getSystemService(INPUT_METHOD_SERVICE) as InputMethodManager).apply {
            hideSoftInputFromWindow(currentFocus?.windowToken, 0)
        }
    }
}