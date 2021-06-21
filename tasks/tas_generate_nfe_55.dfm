inherited TasGenerateNfe55: TTasGenerateNfe55
  Caption = 'Autoriza'#231#227'o Nota Fiscal Eletr'#244'nica'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited UniPanel2: TUniPanel
    inherited SB_conference: TUniSpeedButton
      OnClick = SB_InsertClick
    end
    inherited SB_authorize: TUniSpeedButton
      OnClick = SB_authorizeClick
    end
    inherited SB_Consult: TUniSpeedButton
      OnClick = SB_ConsultClick
    end
    inherited SB_Cancel: TUniSpeedButton
      OnClick = SB_CancelClick
    end
    inherited SB_Print: TUniSpeedButton
      OnClick = SB_PrintClick
    end
    inherited sb_Email: TUniSpeedButton
      OnClick = sb_EmailClick
    end
  end
  inherited UniPanel5: TUniPanel
    Top = 374
    Height = 47
    ExplicitTop = 374
    ExplicitHeight = 47
    object L_NameCompany: TUniLabel
      Left = 4
      Top = 4
      Width = 382
      Height = 14
      Hint = ''
      Caption = 
        'Para Cancelamento informe uma Justificativa (Requer no m'#237'nimo 15' +
        ' caracteres)'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 1
    end
    object E_Motivo_Cancelamento: TUniEdit
      Left = 2
      Top = 18
      Width = 385
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 2
    end
  end
  inherited dbg_Msg: TUniDBGrid
    Height = 341
    Columns = <
      item
        FieldName = 'id'
        Title.Caption = 'Refer'#234'ncia'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'mensagem'
        Title.Caption = 'Mensagem'
        Width = 1534
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
end
