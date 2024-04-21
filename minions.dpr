program minions;

uses
  Vcl.Forms,
  unFormMain in 'unFormMain.pas' {FormMain},
  unFrameMinion in 'unFrameMinion.pas' {FrameMinion: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
