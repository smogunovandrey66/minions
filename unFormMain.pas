unit unFormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, unFrameMinion,
  Vcl.ComCtrls, Vcl.ExtCtrls, System.Generics.Collections;

type
  TFormMain = class(TForm)
    lblCount: TLabel;
    edtCount: TEdit;
    lblCapacityCart: TLabel;
    edtCapacityCart: TEdit;
    scrlbxMain: TScrollBox;
    pnlTop: TPanel;
    pbCommonProgress: TProgressBar;
    lblTotalPurchase: TLabel;
    btnStart: TButton;
    btnStop: TButton;
    chkGoHome: TCheckBox;
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
  private
    { Private declarations }
    FCurTotalPurchase: Integer;
    FMinions: TList<TMinion>;
    procedure AddCountPurchase(aCount: Integer);
    procedure EnableControls(aEnable: Boolean);
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.btnStartClick(Sender: TObject);
var
  i, c: Integer;
  s: String;
begin
  try
    FMinions.Clear;

    s := edtCapacityCart.Text;
    pbCommonProgress.Max := s.ToInteger();
    pbCommonProgress.Position := 0;
    FCurTotalPurchase := 0;

    s := edtCount.Text;

    for i := 0 to s.ToInteger() do begin
      FMinions.Add(TMinion.Create(chkGoHome.Checked, scrlbxMain, AddCountPurchase, pbCommonProgress.Max));
    end;

    EnableControls(False);
  except
    on e: Exception do begin
      ShowMessage('хана, дул, сае!' + #10#13 + e.Message);
    end;
  end;
end;

procedure TFormMain.btnStopClick(Sender: TObject);
var
  minion: TMinion;
begin
  EnableControls(True);
  for minion in FMinions do begin
    minion.Terminate;
  end;

end;

procedure TFormMain.EnableControls(aEnable: Boolean);
begin
  edtCount.Enabled := aEnable;
  lblCount.Enabled := aEnable;
  edtCapacityCart.Enabled := aEnable;
  lblCapacityCart.Enabled := aEnable;
  chkGoHome.Enabled := aEnable;
  btnStart.Enabled := aEnable;
  btnStop.Enabled := not aEnable;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  FMinions := TList<TMinion>.Create;
  pbCommonProgress.Position := 0;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FMinions.Free;
end;

procedure TFormMain.AddCountPurchase(aCount: Integer);
var
  minion: TMinion;
begin
  FCurTotalPurchase := FCurTotalPurchase + aCount;
  pbCommonProgress.Position := FCurTotalPurchase;
  lblTotalPurchase.Caption := Format('%d', [FCurTotalPurchase]);

  if(pbCommonProgress.Max = FCurTotalPurchase ) then begin
    for minion in FMinions do begin
      minion.Terminate;
    end;
    FMinions.Clear;

      EnableControls(True);
  end;
end;

end.
