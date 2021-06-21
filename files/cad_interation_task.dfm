inherited CadinterationTask: TCadinterationTask
  ClientHeight = 474
  Caption = 'Cadastro de Tarefas'
  ExplicitHeight = 533
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 410
    ExplicitTop = 410
  end
  inherited pnl_fundo: TUniPanel
    Height = 105
    ExplicitHeight = 105
  end
  inherited Pc_interacao: TUniPageControl
    Top = 105
    Height = 305
    ActivePage = tbs_interacao
    ExplicitTop = 105
    ExplicitHeight = 305
    inherited tbs_interacao: TUniTabSheet
      ExplicitHeight = 277
      inherited pnl_interacao_row_1: TUniPanel
        Top = 173
        ExplicitTop = 173
        inherited ctn_Situacao: TUniContainerPanel
          Width = 289
          ExplicitWidth = 289
        end
        object ctn_Kind: TUniContainerPanel
          Left = 289
          Top = 0
          Width = 250
          Height = 52
          Hint = ''
          Margins.Left = 5
          ParentColor = False
          Align = alLeft
          TabOrder = 2
        end
        object DTP_Date_Initial: TUniDateTimePicker
          AlignWithMargins = True
          Left = 542
          Top = 3
          Width = 100
          Height = 46
          Hint = ''
          DateTime = 42916.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Align = alLeft
          TabOrder = 3
          FieldLabel = 'Data Inicio'
          FieldLabelAlign = laTop
        end
        object DTP_Date_End: TUniDateTimePicker
          AlignWithMargins = True
          Left = 648
          Top = 3
          Width = 100
          Height = 46
          Hint = ''
          DateTime = 42916.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Align = alLeft
          TabOrder = 4
          FieldLabel = 'Data Fim'
          FieldLabelAlign = laTop
        end
      end
      object pnl_interacao_row_2: TUniPanel [1]
        Left = 0
        Top = 225
        Width = 826
        Height = 52
        Hint = ''
        Align = alBottom
        TabOrder = 1
        BorderStyle = ubsNone
        Caption = ''
        object ctn_priority: TUniContainerPanel
          Left = 289
          Top = 0
          Width = 307
          Height = 52
          Hint = ''
          Margins.Left = 5
          ParentColor = False
          Align = alLeft
          TabOrder = 1
        end
        object ctn_Project: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 289
          Height = 52
          Hint = ''
          Margins.Left = 5
          ParentColor = False
          Align = alLeft
          TabOrder = 2
        end
        object ctn_User: TUniContainerPanel
          Left = 596
          Top = 0
          Width = 230
          Height = 52
          Hint = ''
          Margins.Left = 5
          ParentColor = False
          Align = alClient
          TabOrder = 3
        end
      end
      inherited M_Detail: TUniHTMLMemo
        Height = 167
        TabOrder = 2
        ExplicitHeight = 167
      end
    end
    inherited tbs_atachament: TUniTabSheet
      ExplicitHeight = 277
      inherited UniPanel3: TUniPanel
        inherited Sb_search_Attachament: TUniSpeedButton
          OnClick = nil
        end
        inherited Btn_Download: TUniSpeedButton
          OnClick = nil
        end
        inherited Btn_ApagarAnexo: TUniSpeedButton
          OnClick = nil
        end
      end
      inherited UniDBGrid1: TUniDBGrid
        Height = 213
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 120
    Top = 8
  end
  inherited ds_msg: TDataSource
    Left = 120
  end
  inherited UniFileUpload: TUniFileUpload
    Left = 648
    Top = 136
  end
  inherited DSP: TDataSetProvider
    Left = 592
    Top = 151
  end
  inherited cds_attachament: TClientDataSet
    Left = 552
    Top = 159
  end
  inherited Ds_cds_attachament: TDataSource
    Left = 680
    Top = 200
  end
  inherited UniPopupMenu1: TUniPopupMenu
    Top = 144
  end
end
