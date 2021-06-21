unit base_search;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame, uniLabel, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, uniBasicGrid, uniDBGrid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient,
  Datasnap.Provider, uniPageControl;

type
  TBaseSearch = class(TBaseFrame)
    Dbg_search: TUniDBGrid;
    pnl_botao: TUniPanel;
    DSP: TDataSetProvider;
    cds_search: TClientDataSet;
    Ds_Search: TDataSource;
    UniPageControl1: TUniPageControl;
    tbs_result: TUniTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseSearch: TBaseSearch;

implementation

{$R *.dfm}

end.
