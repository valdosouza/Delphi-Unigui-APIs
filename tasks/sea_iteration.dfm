inherited SeaIteration: TSeaIteration
  ClientHeight = 442
  Caption = 'Pesquisa de Chamados'
  ExplicitHeight = 501
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Height = 378
    ExplicitHeight = 378
    inherited pc_search: TUniPageControl
      Height = 374
      ActivePage = tbs_param
      ExplicitLeft = 4
      ExplicitTop = 1
      ExplicitHeight = 374
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 822
        ExplicitHeight = 346
        inherited pnl_param: TUniPanel
          Height = 315
          ExplicitHeight = 315
          object pnl_param_row_1: TUniPanel
            Left = 2
            Top = 2
            Width = 818
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            object pnl_data: TUniPanel
              Left = 0
              Top = 0
              Width = 216
              Height = 52
              Hint = ''
              Align = alLeft
              TabOrder = 1
              BorderStyle = ubsNone
              Caption = ''
              object chbx_periodo: TUniCheckBox
                AlignWithMargins = True
                Left = 3
                Top = 5
                Width = 210
                Height = 17
                Hint = ''
                Margins.Top = 5
                Margins.Bottom = 0
                Checked = True
                Caption = 'Data Inicial            Data Final'
                Align = alTop
                TabOrder = 1
              end
              object pnl_data_campos: TUniPanel
                Left = 0
                Top = 22
                Width = 216
                Height = 30
                Hint = ''
                Align = alClient
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                object DTP_Date_Initial: TUniDateTimePicker
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 100
                  Height = 24
                  Hint = ''
                  DateTime = 42916.000000000000000000
                  DateFormat = 'dd/MM/yyyy'
                  TimeFormat = 'HH:mm:ss'
                  Align = alLeft
                  TabOrder = 1
                end
                object DTP_Date_End: TUniDateTimePicker
                  AlignWithMargins = True
                  Left = 109
                  Top = 3
                  Width = 100
                  Height = 24
                  Hint = ''
                  DateTime = 42916.000000000000000000
                  DateFormat = 'dd/MM/yyyy'
                  TimeFormat = 'HH:mm:ss'
                  Align = alLeft
                  TabOrder = 2
                end
              end
            end
            object ctn_Customer: TUniContainerPanel
              Left = 343
              Top = 0
              Width = 475
              Height = 52
              Hint = ''
              ParentColor = False
              Align = alClient
              TabOrder = 2
            end
            object E_Number: TUniEdit
              AlignWithMargins = True
              Left = 219
              Top = 3
              Width = 121
              Height = 46
              Hint = ''
              Text = 'E_Number'
              Align = alLeft
              TabOrder = 3
              FieldLabel = 'Ordem'
              FieldLabelAlign = laTop
            end
          end
          object pnl_param_row_2: TUniPanel
            Left = 2
            Top = 54
            Width = 818
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 2
            BorderStyle = ubsNone
            Caption = ''
            object ctn_Situacao: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 313
              Height = 52
              Hint = ''
              ParentColor = False
              Align = alLeft
              TabOrder = 1
            end
          end
        end
        inherited pnl_config: TUniPanel
          Top = 315
          ExplicitTop = 315
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 822
        ExplicitHeight = 346
        inherited dbg_Search: TUniDBGrid
          Height = 346
          Columns = <
            item
              FieldName = 'ordem'
              Title.Caption = 'Itera'#231#227'o'
              Width = 64
            end
            item
              FieldName = 'updated_at'
              Title.Caption = 'Data e hora'
              Width = 138
            end
            item
              FieldName = 'comentario'
              Title.Caption = 'Coment'#225'rio'
              Width = 394
            end
            item
              FieldName = 'situacao'
              Title.Caption = 'Situa'#231#227'o'
              Width = 152
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 378
    ExplicitTop = 378
    inherited Sb_Close: TUniSpeedButton
      Left = 373
      ExplicitLeft = 373
    end
    object Sb_Iteration: TUniSpeedButton
      AlignWithMargins = True
      Left = 281
      Top = 5
      Width = 92
      Height = 54
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Caption = 'Intera'#231#245'es - F9'
      Align = alLeft
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 5
      OnClick = Sb_IterationClick
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 280
    Top = 169
  end
  inherited ds_msg: TDataSource
    Left = 328
    Top = 168
  end
  inherited cds_search: TClientDataSet
    object cds_searchordem: TIntegerField
      FieldName = 'ordem'
      Origin = 'ordem'
      Required = True
    end
    object cds_searchiteration: TIntegerField
      FieldName = 'iteration'
      Origin = 'iteration'
      Required = True
    end
    object cds_searchupdated_at: TDateTimeField
      FieldName = 'updated_at'
      Origin = 'updated_at'
      Required = True
    end
    object cds_searchcomentario: TStringField
      FieldName = 'comentario'
      Origin = 'comentario'
      Size = 50
    end
    object cds_searchsituacao: TStringField
      FieldName = 'situacao'
      Origin = 'situacao'
      Size = 100
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 152
    Top = 65528
  end
end
