unit UnitLOGIN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, DB, ADODB;

type
  TFormLOGIN = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    Username: TLabel;
    Password: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BB_LOGIN: TBitBtn;
    BB_BATAL: TBitBtn;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    procedure BB_LOGINClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLOGIN: TFormLOGIN;

implementation

uses UnitUTAMA, UnitTOKO;

{$R *.dfm}

procedure TFormLOGIN.BB_LOGINClick(Sender: TObject);
Var
  D : String;
begin
  D:= FormUTAMA.The_Path+'DB.mdb';
  If ADOConnection1.Connected = False Then
  Begin
    ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+D+';Persist Security Info=False';
    ADOConnection1.Connected := True;
  End;

  If ADOConnection1.Connected = True Then
  Begin
    If (Edit1.Text <> '') and (Edit2.Text <> '') Then
    Begin
      With ADOQuery1 Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from Pengguna');
        SQL.Add('Where Username = '''+Edit1.Text+''' and Password = '''+Edit2.Text+''' ');
        Open;
      End;
      If ADOQuery1.IsEmpty Then
         MessageDlg('Username atau Password Salah !', mtInformation, [mbOk], 0)
      Else
      Begin
        If ADOQuery1['Akses'] = 'Administrator' Then
        Begin
           FormUTAMA.Pengguna1.Visible := True;
           FormUTAMA.Data1.Visible := True;
           FormUTAMA.Transaksi1.Visible := True;
           FormTOKO.SpeedButton1.Visible := True;
        End;
        FormUTAMA.Login1.Enabled := False;
        FormUTAMA.Logout1.Enabled := True;
      End;
      Edit1.Text := '';
      Edit2.Text := '';
    End
    Else
        MessageDlg('Isilah Username dan Password !', mtInformation, [mbOk], 0);
  End;
end;

end.
