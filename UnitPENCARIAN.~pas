unit UnitPENCARIAN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TFormPENCARIAN = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    procedure Edit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPENCARIAN: TFormPENCARIAN;

implementation
 uses UDM;
{$R *.dfm}

procedure TFormPENCARIAN.Edit1Change(Sender: TObject);
begin
  With DM.QUmum Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from Pembeli');
        if ComboBox1.ItemIndex = 0 then
           SQL.Add('Where ID_Pembeli Like '''+Edit1.Text+'%''  ');
        If ComboBox1.ItemIndex = 1 then
           SQL.Add('Where Pembeli like '''+Edit1.Text+'%'' ');
        Open;
      End;
end;

procedure TFormPENCARIAN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.QUmum.Active:=False;
end;

end.
