import { Button, Dialog, Portal, Text } from "react-native-paper";

export default function DeletePlantDialog({name, hideDialog, visible}) {
    return(
        <Portal>
            <Dialog visible={visible} onDismiss={hideDialog}>
                <Dialog.Title>Alert</Dialog.Title>
                <Dialog.Content>
                    <Text variant="bodyMedium">Are you sure that you want to delete {name}?</Text>
                </Dialog.Content>
                <Dialog.Actions>
                    <Button onPress={hideDialog} buttonColor="red" textColor="white">Cancel</Button>
                    <Button onPress={hideDialog} buttonColor="#689f38" textColor="white">Confirm</Button>
                </Dialog.Actions>
            </Dialog>
        </Portal>
    )
}