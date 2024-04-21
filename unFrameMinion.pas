unit unFrameMinion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, acPNG,
  Vcl.ExtCtrls, Vcl.ComCtrls, System.SyncObjs;

type
  TFrameMinion = class(TFrame)
    pbPurchase: TProgressBar;
    imgMinion: TImage;
    lblCountPurchase: TLabel;
  private
    { Private declarations }
    FCountPurchase: Integer;
  public
    { Public declarations }
    procedure addCountPurchase(aCount: Integer);
  end;

  TMinion = class(TThread)
    private
      FFrameMinion: TFrameMinion;
      FTimeWork: Integer;
      FOnAddCountPurchase: TProc<Integer>;
    protected
      procedure Execute; override;
      function DoWork: Integer; virtual;
    public
      constructor Create(aFreeOnTerminate: Boolean; aScrollBox: TScrollBox; aOnAddCountPurchase: TProc<Integer>; aTotalPurchase: Integer);
      destructor Destroy; override;
  end;

implementation

{$R *.dfm}

var
  numMinion: Integer = 1;

{ TMinion }

constructor TMinion.Create(aFreeOnTerminate: Boolean; aScrollBox: TScrollBox; aOnAddCountPurchase: TProc<Integer>; aTotalPurchase: Integer);
begin
  inherited Create(False);

  FTimeWork := (Random(5) + 1) * 1000;

  FreeOnTerminate := aFreeOnTerminate;
  FFrameMinion := TFrameMinion.Create(aScrollBox.Owner);
  FFrameMinion.Parent := aScrollBox;
  FFrameMinion.Align := alTop;
  FFrameMinion.Name := Format('TFrameMinion_%d', [numMinion]);
  FFrameMinion.pbPurchase.Max := aTotalPurchase;
  FFrameMinion.lblCountPurchase.Caption := '0';

  FOnAddCountPurchase := aOnAddCountPurchase;
  Inc(numMinion);
end;

destructor TMinion.Destroy;
begin
  Synchronize(procedure begin
    FFrameMinion.Destroy
  end);
  inherited;
end;

function TMinion.DoWork: Integer;
begin
  Sleep(FTimeWork);
  Result := 1;
end;

procedure TMinion.Execute;
var
  countForBasket: Integer;
begin
  while not Terminated do begin

    countForBasket := DoWork;

    if Terminated then
      Break;

    Synchronize(procedure
      begin
        FFrameMinion.addCountPurchase(countForBasket);
        if Assigned(FOnAddCountPurchase) then
          FOnAddCountPurchase(countForBasket);
      end);
  end;
end;

{ TFrameMinion }

procedure TFrameMinion.addCountPurchase(aCount: Integer);
begin
  FCountPurchase := FCountPurchase + aCount;
  lblCountPurchase.Caption := Format('%d', [FCountPurchase]);
  pbPurchase.Position := FCountPurchase;
end;

end.
