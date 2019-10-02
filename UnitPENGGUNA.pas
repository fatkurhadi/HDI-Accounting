unit UnitPENGGUNA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, DBCtrls, StdCtrls, Mask;

type
  TFormPENGGUNA = class(TForm)
    Panel1: TPanel;
    SBTambah: TSpeedButton;
    SBEdit: TSpeedButton;
    SBHapus: TSpeedButton;
    SBSimpan: TSpeedButton;
    SBBatal: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Edit1: TEdit;
    DBComboBox1: TDBComboBox;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Change(Sender: TObject);
    procedure SBTambahClick(Sender: TObject);
    procedure SBEditClick(Sender: TObject);
    procedure SBHapusClick(Sender: TObject);
    procedure SBSimpanClick(Sender: TObject);
    procedure SBBatalClick(Sender: TObject);
  private
    procedure normal;
    procedure abnormal;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPENGGUNA: TFormPENGGUNA;

implementation
uses UDM;
{$R *.dfm}

procedure TFormPENGGUNA.normal;
begin
  SBTambah.Enabled:=True;
  SBEdit.Enabled:=True;
  SBHapus.Enabled:=True;
  SBSimpan.Enabled:=False;
  SBBatal.Enabled:=False;
  GroupBox1.Enabled:=False;
end;

procedure TFormPENGGUNA.abnormal;
begin
  SBTambah.Enabled:=False;
  SBEdit.Enabled:=False;
  SBHapus.Enabled:=False;
  SBSimpan.Enabled:=True;
  SBBatal.Enabled:=True;
  GroupBox1.Enabled:=True;
end;

procedure TFormPENGGUNA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.TPengguna.Active:=False;
  FormPENGGUNA := Nil;
  Action := CaFree;
end;

procedure TFormPENGGUNA.Edit1Change(Sender: TObject);
begin
  if DBEdit3.Text = Edit1.Text then
     CheckBox1.Checked:=True
  else
     CheckBox1.Checked:=False;
end;

procedure TFormPENGGUNA.SBTambahClick(Sender: TObject);
begin
   abnormal;
   DM.TPengguna.Insert;
end;

procedure TFormPENGGUNA.SBEditClick(Sender: TObject);
begin
  DM.TPengguna.Edit;
   abnormal;
end;

procedure TFormPENGGUNA.SBHapusClick(Sender: TObject);
begin
  if Application.MessageBox ('Yakin Ingin Hapus Data?',
    'Konfirmasi',MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    DM.TPengguna.Delete;
   normal;
   end;
end;

procedure TFormPENGGUNA.SBSimpanClick(Sender: TObject);
begin
  if Application.MessageBox ('Yakin Ingin Simpan Data?',
      'Konfirmasi',MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      DM.TPengguna.Post;
      normal;
    end;
end;

procedure TFormPENGGUNA.SBBatalClick(Sender: TObject);
begin
   DM.TPengguna.Cancel;
   normal;
end;

end.
