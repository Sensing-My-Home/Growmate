import { View } from "react-native";
import { Button, Dialog, Portal, Text, useTheme } from "react-native-paper";

export default function DeletePlant({ name, hideDialog, visible, showDialog }) {
    const theme = useTheme();

    return (
        <>
            <View style={{ alignItems: 'center', paddingBottom: 30}}>
                <Button
                    textColor={theme.colors.background}
                    buttonColor={theme.colors.error}
                    onPress={showDialog}
                >
                    Delete Plant
                </Button>
            </View>
            <Portal>
                <Dialog visible={visible} onDismiss={hideDialog}>
                    <Dialog.Title>Alert</Dialog.Title>
                    <Dialog.Content>
                        <Text variant="bodyMedium">Are you sure that you want to delete {name}?</Text>
                    </Dialog.Content>
                    <Dialog.Actions>
                        <Button onPress={hideDialog} buttonColor={theme.colors.error} textColor={theme.colors.background}>Cancel</Button>
                        <Button onPress={hideDialog} buttonColor={theme.colors.primary} textColor={theme.colors.background}>Confirm</Button>
                    </Dialog.Actions>
                </Dialog>
            </Portal>
        </>
    )
}