Public Class Form1
    Dim x, y As Integer


    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        x = MousePosition.X - Form1.ActiveForm.Left



        y = MousePosition.Y - Form1.ActiveForm.Top
        Button1.Top = y
        Button1.Left = x
        Label1.Text = CStr(x)



    End Sub
End Class
