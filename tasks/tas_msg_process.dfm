inherited TasMsgProcess: TTasMsgProcess
  object Pnl_Corpo: TUniPanel [0]
    Left = 0
    Top = 0
    Width = 578
    Height = 258
    Hint = ''
    Align = alClient
    TabOrder = 2
    BorderStyle = ubsFrameLowered
    Caption = ''
    object dbg_Msg: TUniDBGrid
      Left = 2
      Top = 2
      Width = 574
      Height = 254
      Hint = ''
      LoadMask.Message = 'Carregando Dados'
      Align = alClient
      TabOrder = 1
      Columns = <
        item
          FieldName = 'id'
          Title.Caption = 'Refer'#234'ncia'
          Width = 304
        end
        item
          FieldName = 'mensagem'
          Title.Caption = 'Mensagem'
          Width = 604
        end>
    end
  end
  object Pnl_Botao: TUniPanel [1]
    Left = 0
    Top = 258
    Width = 578
    Height = 40
    Hint = ''
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = ''
    DesignSize = (
      451
      40)
    object Sb_Verify: TUniSpeedButton
      Left = 5
      Top = 3
      Width = 105
      Height = 30
      Hint = ''
      Visible = False
      Caption = 'Verificar'
      Anchors = [akLeft, akBottom]
      ParentColor = False
      Color = clWindow
      TabOrder = 1
      OnClick = Sb_VerifyClick
    end
  end
end
